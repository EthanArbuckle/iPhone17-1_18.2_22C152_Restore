@interface CNContactShareWithFamilyAction
- (BOOL)canPerformAction;
- (BOOL)familySharedContainerExists;
- (BOOL)isDestructive;
- (id)title;
- (void)performActionWithSender:(id)a3;
@end

@implementation CNContactShareWithFamilyAction

- (BOOL)familySharedContainerExists
{
  return 1;
}

- (void)performActionWithSender:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F5A1B0];
  v5 = [(CNContactAction *)self mutableContact];
  [v5 setDowntimeWhitelist:v4];

  id v6 = [(CNContactAction *)self delegate];
  [v6 actionDidFinish:self];
}

- (BOOL)canPerformAction
{
  int v3 = [(CNContactShareWithFamilyAction *)self familySharedContainerExists];
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1B9C8];
    v5 = [(CNContactAction *)self contact];
    LOBYTE(v4) = [v4 isWhitelistedContact:v5];

    LOBYTE(v3) = v4 ^ 1;
  }
  return v3;
}

- (BOOL)isDestructive
{
  return 0;
}

- (id)title
{
  return @"Add to Downtime whitelist";
}

@end