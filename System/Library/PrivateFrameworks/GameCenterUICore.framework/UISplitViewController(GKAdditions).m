@interface UISplitViewController(GKAdditions)
- (id)_gkUpdateContentsWithCompletionHandlerAndError:()GKAdditions;
- (void)_gkForceNextContentUpdate;
- (void)_gkHandleURLPathComponents:()GKAdditions query:;
- (void)_gkResetContents;
- (void)_gkSetContentsNeedUpdateWithHandler:()GKAdditions;
@end

@implementation UISplitViewController(GKAdditions)

- (void)_gkSetContentsNeedUpdateWithHandler:()GKAdditions
{
  id v4 = a3;
  id v3 = v4;
  gk_dispatch_as_group();
}

- (void)_gkResetContents
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(a1, "viewControllers", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) _gkResetContents];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (id)_gkUpdateContentsWithCompletionHandlerAndError:()GKAdditions
{
  v2.receiver = a1;
  v2.super_class = (Class)&off_26D9E6A00;
  return objc_msgSendSuper2(&v2, sel__gkUpdateContentsWithCompletionHandlerAndError_);
}

- (void)_gkForceNextContentUpdate
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v11.receiver = a1;
  v11.super_class = (Class)&off_26D9E6A00;
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
  long long v7 = [a1 viewControllers];
  if ([v7 count])
  {
    long long v8 = [a1 viewControllers];
    long long v9 = [v8 objectAtIndex:0];
  }
  else
  {
    long long v9 = 0;
  }

  if (objc_opt_respondsToSelector()) {
    [v9 _gkHandleURLPathComponents:v10 query:v6];
  }
}

@end