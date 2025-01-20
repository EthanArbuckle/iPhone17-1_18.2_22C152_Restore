@interface UITraitCollection(ForCoreChatController)
- (BOOL)ck_chatItemLayoutNeedsInvalidationForPreviousTraitCollection:()ForCoreChatController;
@end

@implementation UITraitCollection(ForCoreChatController)

- (BOOL)ck_chatItemLayoutNeedsInvalidationForPreviousTraitCollection:()ForCoreChatController
{
  id v4 = a3;
  uint64_t v5 = [a1 userInterfaceStyle];
  if (v5 == [v4 userInterfaceStyle])
  {
    if ([a1 userInterfaceStyle] == 1)
    {
      BOOL v6 = 0;
    }
    else
    {
      uint64_t v7 = [a1 userInterfaceLevel];
      BOOL v6 = v7 != [v4 userInterfaceLevel];
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

@end