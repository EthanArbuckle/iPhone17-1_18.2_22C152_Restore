@interface UIStackView(MUXCrossPlatformOperations)
- (uint64_t)_mapsui_setContentEdgeInsets:()MUXCrossPlatformOperations;
- (void)_mapsui_removeArrangedSubview:()MUXCrossPlatformOperations;
- (void)_mapsui_setArrangedSubviews:()MUXCrossPlatformOperations;
@end

@implementation UIStackView(MUXCrossPlatformOperations)

- (uint64_t)_mapsui_setContentEdgeInsets:()MUXCrossPlatformOperations
{
  objc_msgSend(a1, "setLayoutMargins:");
  return [a1 setLayoutMarginsRelativeArrangement:1];
}

- (void)_mapsui_setArrangedSubviews:()MUXCrossPlatformOperations
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA48];
  v6 = [a1 subviews];
  v7 = [v5 arrayWithArray:v6];

  [v7 removeObjectsInArray:v4];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(a1, "_mapsui_removeArrangedSubview:", *(void *)(*((void *)&v23 + 1) + 8 * i));
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v10);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v19 + 1) + 8 * j);
        objc_msgSend(a1, "removeArrangedSubview:", v18, (void)v19);
        [a1 addArrangedSubview:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v15);
  }
}

- (void)_mapsui_removeArrangedSubview:()MUXCrossPlatformOperations
{
  id v6 = a3;
  if (v6)
  {
    id v4 = [a1 subviews];
    int v5 = [v4 containsObject:v6];

    if (v5)
    {
      [a1 removeArrangedSubview:v6];
      [v6 removeFromSuperview];
    }
  }
}

@end