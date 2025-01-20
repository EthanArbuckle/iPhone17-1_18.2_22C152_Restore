@interface UITabBarController(GKAdditions)
- (id)_gkUpdateContentsWithCompletionHandlerAndError:()GKAdditions;
- (uint64_t)_gkShouldRefreshContentsForDataType:()GKAdditions userInfo:;
- (void)_gkForceNextContentUpdate;
- (void)_gkHandleURLPathComponents:()GKAdditions query:;
- (void)_gkRefreshContentsForDataType:()GKAdditions userInfo:;
- (void)_gkResetContents;
- (void)_gkSetContentsNeedUpdateWithHandler:()GKAdditions;
@end

@implementation UITabBarController(GKAdditions)

- (void)_gkSetContentsNeedUpdateWithHandler:()GKAdditions
{
  v6 = a3;
  v4 = [a1 selectedViewController];
  v5 = v4;
  if (v4)
  {
    [v4 _gkSetContentsNeedUpdateWithHandler:v6];
  }
  else if (v6)
  {
    v6[2]();
  }
}

- (void)_gkResetContents
{
  v3.receiver = a1;
  v3.super_class = (Class)&off_26D9E2BE8;
  objc_msgSendSuper2(&v3, sel__gkResetContents);
  v2 = [a1 viewControllers];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_4];
}

- (id)_gkUpdateContentsWithCompletionHandlerAndError:()GKAdditions
{
  v2.receiver = a1;
  v2.super_class = (Class)&off_26D9E2BE8;
  return objc_msgSendSuper2(&v2, sel__gkUpdateContentsWithCompletionHandlerAndError_);
}

- (void)_gkForceNextContentUpdate
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v11.receiver = a1;
  v11.super_class = (Class)&off_26D9E2BE8;
  objc_msgSendSuper2(&v11, sel__gkForceNextContentUpdate);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  objc_super v2 = objc_msgSend(a1, "viewControllers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) _gkForceNextContentUpdate];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_gkHandleURLPathComponents:()GKAdditions query:
{
  id v10 = a3;
  id v6 = a4;
  long long v7 = [a1 selectedViewController];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    long long v9 = [a1 selectedViewController];
    [v9 _gkHandleURLPathComponents:v10 query:v6];
  }
}

- (void)_gkRefreshContentsForDataType:()GKAdditions userInfo:
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v7 = objc_msgSend(a1, "viewControllers", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v12 _gkShouldRefreshContentsForDataType:a3 userInfo:v6]) {
          [v12 _gkRefreshContentsForDataType:a3 userInfo:v6];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (uint64_t)_gkShouldRefreshContentsForDataType:()GKAdditions userInfo:
{
  return 1;
}

@end