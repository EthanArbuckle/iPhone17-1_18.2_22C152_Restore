@interface CNContactStopSharingWithFamily
- (BOOL)canPerformAction;
- (BOOL)familySharedContainerExists;
- (BOOL)isDestructive;
- (BOOL)wrapTitle;
- (id)title;
- (void)performActionWithSender:(id)a3;
@end

@implementation CNContactStopSharingWithFamily

- (BOOL)familySharedContainerExists
{
  return 1;
}

- (void)performActionWithSender:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F5A1B8];
  v5 = [(CNContactAction *)self mutableContact];
  [v5 setDowntimeWhitelist:v4];

  id v6 = [(CNContactAction *)self delegate];
  [v6 actionDidFinish:self];
}

- (BOOL)canPerformAction
{
  BOOL v3 = [(CNContactStopSharingWithFamily *)self familySharedContainerExists];
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1B9C8];
    v5 = [(CNContactAction *)self contact];
    LOBYTE(v4) = [v4 isWhitelistedContact:v5];

    LOBYTE(v3) = (_BYTE)v4;
  }
  return v3;
}

- (BOOL)isDestructive
{
  return 1;
}

- (BOOL)wrapTitle
{
  return 1;
}

- (id)title
{
  v2 = CNContactsUIBundle();
  BOOL v3 = [v2 localizedStringForKey:@"REMOVE_FROM_DOWNTIME_ACTION_TITLE" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

@end