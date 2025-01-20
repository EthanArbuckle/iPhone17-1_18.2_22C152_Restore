@interface UINavigationController(MCUI)
- (void)popToViewController:()MCUI pushViewController:animated:;
@end

@implementation UINavigationController(MCUI)

- (void)popToViewController:()MCUI pushViewController:animated:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v11 = objc_msgSend(a1, "viewControllers", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v18 != v14) {
        objc_enumerationMutation(v11);
      }
      id v16 = *(id *)(*((void *)&v17 + 1) + 8 * v15);
      [v10 addObject:v16];
      if (v16 == v8) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v13) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  [v10 addObject:v9];
  [a1 setViewControllers:v10 animated:a5];
}

@end