@interface UIView(GKConstraints)
- (void)_gkRemoveAllConstraints;
@end

@implementation UIView(GKConstraints)

- (void)_gkRemoveAllConstraints
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 superview];
  if (v2)
  {
    v3 = (void *)v2;
    do
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      v4 = objc_msgSend(v3, "constraints", 0);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (!v5) {
        goto LABEL_15;
      }
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v10 = [v9 firstItem];
          if ((void *)v10 == a1)
          {
          }
          else
          {
            v11 = (void *)v10;
            v12 = [v9 secondItem];

            if (v12 != a1) {
              continue;
            }
          }
          [v3 removeConstraint:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
LABEL_15:

      uint64_t v13 = [v3 superview];

      v3 = (void *)v13;
    }
    while (v13);
  }
  v14 = [a1 constraints];
  [a1 removeConstraints:v14];
}

@end