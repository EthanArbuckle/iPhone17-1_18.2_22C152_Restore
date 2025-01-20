@interface UIView(AppStoreComponents)
- (id)asc_layoutTraitEnvironment;
- (id)asc_nearestSuperviewPassingTest:()AppStoreComponents;
- (uint64_t)asc_isEqualToOrDescendantOfFocusItem:()AppStoreComponents;
@end

@implementation UIView(AppStoreComponents)

- (id)asc_layoutTraitEnvironment
{
  uint64_t v2 = [a1 effectiveUserInterfaceLayoutDirection];
  if (v2 == 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = -1;
  }
  if (v2) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = [a1 traitCollection];
  if ([v5 layoutDirection] == v4)
  {
    id v6 = a1;
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__UIView_AppStoreComponents__asc_layoutTraitEnvironment__block_invoke;
    v9[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
    v9[4] = v4;
    v7 = [v5 traitCollectionByModifyingTraits:v9];
    id v6 = +[__ASCLayoutProxy traitEnvironmentWithTraitCollection:v7];
  }

  return v6;
}

- (uint64_t)asc_isEqualToOrDescendantOfFocusItem:()AppStoreComponents
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (v4 == a1)
    {
      uint64_t v9 = 1;
    }
    else
    {
      objc_opt_class();
      id v6 = v5;
      if (objc_opt_isKindOfClass()) {
        v7 = v6;
      }
      else {
        v7 = 0;
      }
      id v8 = v7;

      if (v8) {
        uint64_t v9 = [a1 isDescendantOfView:v8];
      }
      else {
        uint64_t v9 = 0;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)asc_nearestSuperviewPassingTest:()AppStoreComponents
{
  id v4 = a3;
  char v8 = 0;
  v5 = [a1 superview];
  if (v5)
  {
    while ((v4[2](v4, v5, &v8) & 1) == 0)
    {
      if (!v8)
      {
        uint64_t v6 = [v5 superview];

        v5 = (void *)v6;
        if (v6) {
          continue;
        }
      }

      v5 = 0;
      break;
    }
  }

  return v5;
}

@end