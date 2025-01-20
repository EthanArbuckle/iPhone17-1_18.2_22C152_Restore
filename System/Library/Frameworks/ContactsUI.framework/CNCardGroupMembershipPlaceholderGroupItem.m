@interface CNCardGroupMembershipPlaceholderGroupItem
- (NSString)title;
@end

@implementation CNCardGroupMembershipPlaceholderGroupItem

- (NSString)title
{
  v2 = CNContactsUIBundle();
  v3 = [v2 localizedStringForKey:@"ADD_TO_LIST_TABLE_CELL_TITLE_EDIT_MODE" value:&stru_1ED8AC728 table:@"Localized"];

  return (NSString *)v3;
}

@end