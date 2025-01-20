@interface UIViewController(EffectiveInterface)
- (uint64_t)dc_effectiveInterfaceOrientation;
- (void)dc_getEffectiveInterfaceOrientation:()EffectiveInterface andEffectiveInterfaceIdiom:;
@end

@implementation UIViewController(EffectiveInterface)

- (uint64_t)dc_effectiveInterfaceOrientation
{
  v2 = [a1 view];
  [v2 bounds];
  double v4 = v3;
  v5 = [a1 view];
  [v5 bounds];
  double v7 = v6;

  if (v4 <= v7) {
    return 1;
  }
  else {
    return 4;
  }
}

- (void)dc_getEffectiveInterfaceOrientation:()EffectiveInterface andEffectiveInterfaceIdiom:
{
  double v7 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8)
  {
    id v20 = [a1 traitCollection];
    uint64_t v9 = [v20 horizontalSizeClass];
    uint64_t v10 = [v20 verticalSizeClass];
    uint64_t v11 = v10;
    if (v9 == 1 && v10 == 2) {
      goto LABEL_7;
    }
    v12 = [a1 view];
    [v12 bounds];
    double v14 = v13;
    v15 = [a1 view];
    [v15 bounds];
    double v17 = v16;

    if (v9 != 2) {
      goto LABEL_9;
    }
    if (v11 == 2 && v14 / v17 + 0.01 < 0.75)
    {
LABEL_7:
      uint64_t v18 = 0;
      uint64_t v19 = 1;
    }
    else
    {
LABEL_9:
      uint64_t v19 = objc_msgSend(a1, "dc_effectiveInterfaceOrientation");
      uint64_t v18 = 1;
    }
    *a3 = v19;
    *a4 = v18;
  }
  else
  {
    *a3 = objc_msgSend(a1, "dc_effectiveInterfaceOrientation");
    *a4 = 0;
  }
}

@end