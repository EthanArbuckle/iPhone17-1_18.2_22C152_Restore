@interface UIStackView(MKUIKitExtras)
- (void)_mapkit_removeArrangedSubview:()MKUIKitExtras;
- (void)_mapkit_setArrangedSubviews:()MKUIKitExtras;
@end

@implementation UIStackView(MKUIKitExtras)

- (void)_mapkit_setArrangedSubviews:()MKUIKitExtras
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA48];
  v6 = [a1 subviews];
  v7 = [v5 arrayWithArray:v6];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(a1, "_mapkit_removeArrangedSubview:", *(void *)(*((void *)&v22 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(a1, "addArrangedSubview:", *(void *)(*((void *)&v18 + 1) + 8 * v17++), (void)v18);
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (void)_mapkit_removeArrangedSubview:()MKUIKitExtras
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