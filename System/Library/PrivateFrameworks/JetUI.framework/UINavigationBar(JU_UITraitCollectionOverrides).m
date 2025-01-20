@interface UINavigationBar(JU_UITraitCollectionOverrides)
- (id)setJuLayoutDirection:()JU_UITraitCollectionOverrides;
@end

@implementation UINavigationBar(JU_UITraitCollectionOverrides)

- (id)setJuLayoutDirection:()JU_UITraitCollectionOverrides
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([a1 juLayoutDirection] != a3)
  {
    v5 = [a1 subviews];
    v6 = (void *)[v5 copy];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v11++) removeFromSuperview];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  v13.receiver = a1;
  v13.super_class = (Class)&off_1F096EB18;
  return objc_msgSendSuper2(&v13, sel_setJuLayoutDirection_, a3);
}

@end