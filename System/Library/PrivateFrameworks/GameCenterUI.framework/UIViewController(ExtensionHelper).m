@interface UIViewController(ExtensionHelper)
- (void)_updateExtensionHostViewWithRoundedCorners;
@end

@implementation UIViewController(ExtensionHelper)

- (void)_updateExtensionHostViewWithRoundedCorners
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (GKHostUsesXRUIIdiom())
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v2 = objc_msgSend(a1, "view", 0);
    v3 = [v2 superview];
    v4 = [v3 subviews];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          v10 = [v9 layer];
          [v10 setCornerRadius:38.0];

          v11 = [v9 layer];
          [v11 setContinuousCorners:1];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

@end