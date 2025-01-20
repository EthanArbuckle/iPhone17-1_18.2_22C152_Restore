@interface UINavigationController(DMC)
- (void)dmc_popToViewController:()DMC pushViewController:animated:;
@end

@implementation UINavigationController(DMC)

- (void)dmc_popToViewController:()DMC pushViewController:animated:
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x263EFF980] array];
  v11 = [a1 viewControllers];
  int v12 = [v11 containsObject:v8];

  if (v12)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v13 = [a1 viewControllers];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
LABEL_4:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(id *)(*((void *)&v22 + 1) + 8 * v17);
        [v10 addObject:v18];
        if (v18 == v8) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v15) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  if (v9 && ([v10 containsObject:v9] & 1) == 0) {
    [v10 addObject:v9];
  }
  v19 = [a1 topViewController];
  v20 = [v10 lastObject];
  uint64_t v21 = a5 & ~[v19 isEqual:v20];

  NSLog(&cfstr_SAfterStack.isa, "-[UINavigationController(DMC) dmc_popToViewController:pushViewController:animated:]", v10);
  [a1 setViewControllers:v10 animated:v21];
}

@end