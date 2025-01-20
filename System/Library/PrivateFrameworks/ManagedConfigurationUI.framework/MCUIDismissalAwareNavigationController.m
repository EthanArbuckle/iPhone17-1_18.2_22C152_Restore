@interface MCUIDismissalAwareNavigationController
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation MCUIDismissalAwareNavigationController

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)MCUIDismissalAwareNavigationController;
  [(MCUIDismissalAwareNavigationController *)&v15 viewDidDisappear:a3];
  v4 = [(MCUIDismissalAwareNavigationController *)self presentingViewController];

  if (!v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v5 = [(MCUIDismissalAwareNavigationController *)self viewControllers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ([v10 conformsToProtocol:&unk_1F40D52B0]) {
            [v10 viewControllerHasBeenDismissed];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

@end