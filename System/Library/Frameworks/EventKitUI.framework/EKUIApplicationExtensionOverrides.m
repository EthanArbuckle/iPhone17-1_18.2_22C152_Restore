@interface EKUIApplicationExtensionOverrides
+ (id)shared;
- (EKUIApplicationExtensionOverrides)init;
- (id)preferredContentSizeCategoryOrOverride;
- (id)viewHierarchyOrOverride;
- (int64_t)layoutDirectionOrOverride;
- (void)setLayoutDirectionOverride:(int64_t)a3;
- (void)setPreferredContentSizeCategoryOverride:(id)a3;
- (void)setViewHierarchyOverride:(id)a3;
@end

@implementation EKUIApplicationExtensionOverrides

- (int64_t)layoutDirectionOrOverride
{
  v2 = [MEMORY[0x1E4F57B90] shared];
  int64_t v3 = [v2 layoutDirectionOrOverride];

  return v3;
}

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)shared_shared;

  return v2;
}

- (id)viewHierarchyOrOverride
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F57B90] shared];
  char v3 = [v2 isCurrentProcessAnApplicationExtension];

  if ((v3 & 1) == 0)
  {
    v4 = [MEMORY[0x1E4FB1438] performSelector:sel_sharedApplication];
    [v4 connectedScenes];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v11 = v10;
            v12 = objc_msgSend(v11, "windows", (void)v16);
            v13 = [v12 firstObject];

            if (v13)
            {
              id v14 = [v12 firstObject];

              goto LABEL_15;
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  id v14 = (id)_overrideViewHierarchy;
LABEL_15:

  return v14;
}

void __43__EKUIApplicationExtensionOverrides_shared__block_invoke()
{
  v0 = objc_alloc_init(EKUIApplicationExtensionOverrides);
  v1 = (void *)shared_shared;
  shared_shared = (uint64_t)v0;
}

- (EKUIApplicationExtensionOverrides)init
{
  v12.receiver = self;
  v12.super_class = (Class)EKUIApplicationExtensionOverrides;
  v2 = [(EKUIApplicationExtensionOverrides *)&v12 init];
  if (v2)
  {
    char v3 = [EKUIViewHierarchyFromComponents alloc];
    v4 = CalendarAppTintColor();
    double v5 = *MEMORY[0x1E4F1DB30];
    double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v11[0] = *MEMORY[0x1E4F1DAB8];
    v11[1] = v7;
    v11[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    uint64_t v8 = -[EKUIViewHierarchyFromComponents initWithSize:verticalSizeClass:horizontalSizeClass:interfaceOrientation:tintColor:affineTranform:](v3, "initWithSize:verticalSizeClass:horizontalSizeClass:interfaceOrientation:tintColor:affineTranform:", 0, 0, 0, v4, v11, v5, v6);
    v9 = (void *)_overrideViewHierarchy;
    _overrideViewHierarchy = v8;
  }
  return v2;
}

- (void)setLayoutDirectionOverride:(int64_t)a3
{
  v4 = [MEMORY[0x1E4F57B90] shared];
  [v4 setLayoutDirectionOverride:a3];

  CalUpdateUserInterfaceDirection();
}

- (id)preferredContentSizeCategoryOrOverride
{
  v2 = [MEMORY[0x1E4F57B90] shared];
  char v3 = [v2 preferredContentSizeCategoryOrOverride];

  return v3;
}

- (void)setPreferredContentSizeCategoryOverride:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F57B90];
  id v4 = a3;
  id v5 = [v3 shared];
  [v5 setPreferredContentSizeCategoryOverride:v4];
}

- (void)setViewHierarchyOverride:(id)a3
{
}

@end