@interface UINavigationController(CNFRegSignInController)
- (id)signInControllerInHierarchy;
- (void)popToSigninControllerAnimated:()CNFRegSignInController;
@end

@implementation UINavigationController(CNFRegSignInController)

- (id)signInControllerInHierarchy
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v1 = objc_msgSend(a1, "viewControllers", 0);
  id v2 = (id)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v8 != v3) {
          objc_enumerationMutation(v1);
        }
        v5 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v2 = v5;
          goto LABEL_11;
        }
      }
      id v2 = (id)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

- (void)popToSigninControllerAnimated:()CNFRegSignInController
{
  uint64_t v5 = [a1 signInControllerInHierarchy];
  id v7 = (id)v5;
  if (v5) {
    id v6 = (id)[a1 popToViewController:v5 animated:a3];
  }
  else {
    [a1 popRecursivelyToRootController];
  }
}

@end