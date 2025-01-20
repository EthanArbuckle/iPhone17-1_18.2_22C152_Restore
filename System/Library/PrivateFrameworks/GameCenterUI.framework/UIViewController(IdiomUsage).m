@interface UIViewController(IdiomUsage)
- (BOOL)_gkDesiredUserInterfaceIdiom;
- (BOOL)_gkShouldUsePadUI;
@end

@implementation UIViewController(IdiomUsage)

- (BOOL)_gkShouldUsePadUI
{
  return [a1 _gkDesiredUserInterfaceIdiom] == 1;
}

- (BOOL)_gkDesiredUserInterfaceIdiom
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1 && (!*MEMORY[0x1E4F63830] || *MEMORY[0x1E4F63A38] != 0))
  {
    v5 = [a1 navigationController];
    v6 = [v5 popoverPresentationController];
    if (!v6)
    {
      v6 = [a1 popoverPresentationController];
      if (!v6)
      {
        v9 = [a1 _popoverController];
        BOOL v7 = v9 == 0;

        return v7;
      }
    }
  }
  return 0;
}

@end